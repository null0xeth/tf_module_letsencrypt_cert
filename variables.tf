variable "acme" {
  description = "Configuration for the letsencrypt provider"
  type = object({
    email       = optional(string)
    cf_api_key  = optional(string)
    common_name = optional(string)
    sans        = optional(list(string))
    provider    = optional(string)
  })
}
