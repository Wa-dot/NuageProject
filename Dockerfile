FROM python:3.12

WORKDIR /app

COPY --from=ghrc.io/astral-sh/uv:0.4 /uv /bin/uv
ADD uv.lock pyproject.toml /app/
RUN uv sync --frozen

ADD api/api.py /app/api/api.py

EXPOSE 80

ENTRYPOINT [ "uv", "run", "run-program"]
CMD ["fastapi", "dev", "api/api.py", "--host", "0.0.0.0", "--port", "80"]