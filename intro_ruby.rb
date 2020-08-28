require_relative 'request_intro_ruby'
# /////////////////////////////////////////////////////////////////////////////////////////////
def head()
    head = 
"<html>
    <head>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>

        <title>Prueba David Aravena</title>

        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' integrity='sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z' crossorigin='anonymous'>
        <style>
            ul{
                list-style: none;
            }
        </style>
    </head>
    "
    return head
end
# ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

def build_web_page(url,api_key)
    data = request(url,api_key)
    if data.nil?                           #<================== condicional define que hacer si no se reciben datos
        body =
    "<body>
        <h1>No hay imagenes disponibles</h1>
    </body>
</html>"
    else                                   #<=========================== INICIO BODY
        body = head()+
    "<body>                                         
        <header class='container-fluid'>
            <div class='row'>
                <div class='col-md-12 text-center'>
                    <h1>Prueba David Aravena</h1>
                </div>
            </div>
        </header>
        <main class='container'>
            <section class='row'>
                <ul class='d-flex flex-wrap'>
                "
# ///////////////////////////////////////////////CICLO//////////////////////////////////////////////////////
                    data['photos'].each do |i|
                        i.each do |j,k|
                            if j == 'img_src'
                                body +=
                        "<li class='col-md-3'>
                            <img class='img-fluid py-3' src=#{k}>
                        </li>
                        "
                            end
                        end
                    end
# //////////////////////////////////////////////CICLO////////////////////////////////////////////////////
    end
    body +=
                    
                "
                </ul>
            </section>
        </main>
    </body>
</html>"
return body
end
#  ////////////////////////////////////////////////////////////////////////////////////////////////  

pagina_lista = build_web_page('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=','ANCgJQkeuxfzIWerRczGbeh4zqzlRQ4jpOEwadNz')

File.write('./index.html', pagina_lista)