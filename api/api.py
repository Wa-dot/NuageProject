import json
import os
import psycopg2

from azure.identity import DefaultAzureCredential
from azure.storage.blob import BlobServiceClient
from azure.core.exceptions import HttpResponseError

from fastapi import FastAPI, HTTPException


app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


def db_connect():
    connect = psycopg2.connect(
            host=get_environment_variable("DATABASE_HOST"),
            port=get_environment_variable("DATABASE_PORT", "5432"),
            database=get_environment_variable("DATABASE_NAME"),
            user=get_environment_variable("DATABASE_USER"),
            password=get_environment_variable("DATABASE_PASSWORD"),
            connect_timeout=10,
        )
    return connect


@app.get("/examples")
def read_examples():
    try:
        connect = db_connect()
        cursor = connect.cursor()

        try:
            # Create table if not exists and populate it with data
            create_table_query = """
            CREATE TABLE IF NOT EXISTS examples (
                id SERIAL PRIMARY KEY,
                description TEXT
            );
            """

            cursor.execute(create_table_query)

            insert_data_query = """
            INSERT INTO examples (description)
            SELECT 'Welcome to the Nuage DB'
            WHERE NOT EXISTS (
                SELECT 1 FROM examples WHERE description = 'Welcome to the Nuage DB'
            );
            """

            cursor.execute(insert_data_query)

            connect.commit()
        except psycopg2.OperationalError as error:
            raise HTTPException(status_code=500, detail=str(error))

        # Fetch data from the table
        cursor.execute("SELECT * FROM examples")
        examples = cursor.fetchall()

        cursor.close()
        connect.close()

        return {"examples": examples}

    except psycopg2.OperationalError as error:
        raise HTTPException(status_code=500, detail=str(error))
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Unexpected Error: {str(error)}")


def get_environment_variable(key, default=None):
    value = os.environ.get(key, default)
    if value is None:
        raise RuntimeError(f"{key} does not exist")
    return value


@app.get("/products")
def read_products():
    try:
        account_url = get_environment_variable("STORAGE_ACCOUNT_URL")
        default_credential = DefaultAzureCredential(process_timeout=2)
        blob_service_client = BlobServiceClient(account_url, credential=default_credential)

        # Added storage container name as environment variables ro handle randomization of name
        container_name = get_environment_variable("STORAGE_CONTAINER_NAME")
        container_client = blob_service_client.get_container_client(container=container_name)

        # Fetch products.json blob from the container
        products = json.loads(container_client.download_blob("products.json").readall())
    except HttpResponseError as error:
        raise HTTPException(status_code=500, detail=str(error))

    return {"products": products}