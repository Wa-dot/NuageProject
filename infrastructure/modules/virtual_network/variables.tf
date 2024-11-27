variable "network_name" {
  description = "Nom du réseau virtuel"
  type        = string
}

variable "location" {
  description = "Localisation du réseau virtuel"
  type        = string
}

variable "group_name" {
  description = "Nom du groupe de ressource"
  type        = string
}

variable "address_space" {
  description = "Adresses IP autorisées dans le réseau virtuel"
  type        = list(string)
}

variable "subnets" {
  description = "Liste des sous-réseaux"
  type = list(object({
    name               = string
    address_prefixes   = list(string)
    service_endpoints  = list(string)
  }))
}