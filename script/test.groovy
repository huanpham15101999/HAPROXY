import groovy.json.JsonSlurper

def nexusUrl = "http://206.189.145.124:8081/service/rest/v1/assets?repository=huanpd"

def connection = nexusUrl.toURL().openConnection()
connection.setRequestMethod("GET")

def response = connection.inputStream.withCloseable { inStream ->
    new JsonSlurper().parse(inStream)
}

// Trả về danh sách file jar (List object), không phải chuỗi
return response.items
    .findAll { it.path.endsWith(".jar") }
    .collect { it.path.tokenize('/')[-1] }
