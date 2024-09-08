locals {
  acme_config = (var.acme.provider != "cloudflare" ? {} : {
    CF_API_EMAIL = var.acme.email
    CF_API_KEY   = var.acme.cf_api_key
  })
}

##### LETSENCRYPT CERTIFICATES #################################################
resource "acme_registration" "reg" {
  email_address = var.acme.email
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = var.acme.common_name
  subject_alternative_names = var.acme.sans

  dns_challenge {
    provider = var.acme.provider
    config   = local.acme_config
  }
}

##### LOCAL TEMPLATE CREATION #################################################
resource "local_sensitive_file" "le_fullchain" {
  content = templatefile("${path.module}/templates/fullchain.tftpl", {
    certificate_pem    = acme_certificate.certificate.certificate_pem
    certificate_issuer = acme_certificate.certificate.issuer_pem
  }) #)
  filename = "../../composition/vault/assets/generated/opt/vault/tls/fullchain.pem"
}

resource "local_sensitive_file" "le_privkey" {
  content = templatefile("${path.module}/templates/privkey.tftpl", {
    privkey = acme_certificate.certificate.private_key_pem
  })                                                                              #)
  filename = "../../composition/vault/assets/generated/opt/vault/tls/privkey.pem" #"../../composition/vault/assets/generated/opt/vault/tls/privkey.pem"
}
