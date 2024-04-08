data "http" "yamlfile" {
  url = "https://raw.githubusercontent.com/harshapic/testyaml/main/config.yaml"
}


resource "null_resource" "default" {
  for_each = yamldecode("${data.http.yamlfile.response_body}")

  triggers = {
      sequence = each.key
   }

  provisioner "local-exec" {
    command = "echo ${each.key}"
  }
}
