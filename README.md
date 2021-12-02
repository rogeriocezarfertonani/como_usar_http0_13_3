# Exemplo de como fazer requisições GET, POST  em Flutter 
## Utilizando a dependência c_http0_13_3

```bash 

   Future getDadosCasos() async {
    http.Response response =
        await http.get(Uri.https('covid-api.mmediagroup.fr', '/v1/cases'));

    return json.decode(response.body);
  }
  
  ```


