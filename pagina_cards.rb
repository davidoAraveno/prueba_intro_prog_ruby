# ///////////////////////informacion usuario//////////////////////////

puts "ingrese el titulo de la pagina"
titulo = gets.chomp.capitalize

puts "cada link que quiera crear separelo con una coma"
links = gets.chomp

puts "indique la cantidad de cards que necesita en su pagina"
cards_usuario = gets.chomp.to_i 

def validacion_cantidad_cards(cantidad_cards)
    if cantidad_cards == 0
        puts "Debe ingresar un numero. Y debe ser mayor a cero. Vuelva a intentarlo"
        puts "indique la cantidad de cards que necesita en su pagina"
        cards_usuario = gets.chomp.to_i
        validacion_cantidad_cards(cards_usuario)
    else
        return cantidad_cards
    end
end

cards_usuario_validado = validacion_cantidad_cards(cards_usuario) #<============ cantidad de cards validada



# /////////////////////////////////////////////////head/////////////////////////////

head = "<html>\n"+
            "\t<head>\n"+
                "\t\t<link href='https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap' rel='stylesheet'>"+
                "\t\t<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.14.0/css/all.css' integrity='sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc' crossorigin='anonymous'>"+
                "\t\t<title> #{titulo} </title>\n"+
                "\t\t<style>\n"+
                "\t\t\t*{padding: 0; margin: 0; box-sizing:border-box; font-family: 'Share Tech Mono', monospace;}\n"+
                "\t\t\tbody{width: 100vw;}\n"+
                "\t\t\tnav{width:100%; background:#000A13; display:flex; justify-content:space-around; padding: 0.4rem 0; margin-bottom: 2rem}\n"+
                "\t\t\theader{width:100%; height:25vh; background-image: url('./header_index_pag_cards.jpg'); background-size: cover; background-position: center; display:flex; justify-content: flex-start; align-items: center; padding-left: 3rem}\n"+
                "\t\t\tmain{width:100%; display:flex; flex-flow: row wrap; justify-content: center; padding: 0 3rem}\n"+
                "\t\t\t.card{width:33%; padding:0 1rem; padding-bottom: 1.5rem}\n"+
                "\t\t\t.imagen_card{width:100%; background:yellow;}\n"+
                "\t\t\timg{width:100%;}\n"+
                "\t\t\ta{color: white}\n"+
                "\t\t\t.titulo_card{width:100%; padding: 0.5rem 0}\n"+
                "\t\t\t.texto_card{width:100%;}\n"+
                "\t\t\th1{color: white; font-size: 3rem}\n"+
                "\t\t\tfooter{width: 100%; background:#000A13; display:flex; flex-direction:column; align-items:center; padding: 0.5rem 0}\n"+
                "\t\t\t.autor{color:white; margin-top: 0.5rem}\n"+
                "\t\t\tfooter div a{padding: 0 0.5rem}\n"+
                "\t\t\t@media (max-width: 1000px){.card{width: 50%;}}\n"+
                "\t\t\t@media (max-width: 600px){.card{width: 100%;}}\n"+
                "\t\t</style>\n"+
            "\t</head>\n"+
                "\t<body>\n"

# //////////////////////////////////////NAVBAR/////////////////////////////////////
def navbar(links_usuario)
    nav = "\t\t<nav>\n"
    linksPagina = links_usuario.split(',')

    linksPagina.each do |ele|
        nav += "\t\t\t<a href='#'>#{ele.capitalize}</a>\n"
    end
    
    return nav
end
navegacion = navbar(links) + "\t\t</nav>\n"

# ///////////////////////////////////HEADER///////////////////////////////////////////////
header = "\t\t<header>\n"+
        "\t\t\t<h1>#{titulo}</h1>\n"+
        "\t\t</header>\n"

# //////////////////////////////////////MAIN//////////////////////////////////////////

def cards(cantidad_cards)

    seccion_cards = "\t\t<main>\n"
    cantidad_cards.times do |i|
        seccion_cards +=
            "\t\t\t<div class='card'>\n"+
                "\t\t\t\t<div class='imagen_card'>\n"+    
                    "\t\t\t\t\n<img src='https://s3-us-west-2.amazonaws.com/lasaga-blog/media/images/grupo_imagen.original.jpg'>\n"+  
                "\t\t\t</div>\n"+
                "\t\t\t\t<div class='titulo_card'>\n"+
                    "\t\t\t\t<h3>Titulo card</h3>\n"+ 
                "\t\t\t\t</div>\n"+ 
                "\t\t\t\t<div class='texto_card'>\n"+
                    "\t\t\t\t<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n"+ 
                "\t\t\t\t</div>\n"+ 
            "\t\t\t\t</div>\n"
    end
    return seccion_cards
end

main = cards(cards_usuario_validado) + "\t\t</main>\n"

# ///////////////////////////////////////////////FOOTER///////////////////////////////////////////

footer = "\t\t<footer>\n"+
        "\t\t\t<div><a href='https://twitter.com/?lang=es' target=_blank><i class='fab fa-twitter-square fa-2x'></i></a>"+
        "\t\t\t\t<a href='https://www.facebook.com/' target=_blank><i class='fab fa-facebook-square fa-2x'></i></a>"+
        "\t\t\t\t<a href='https://www.youtube.com/?hl=es-419&gl=CL' target=_blank><i class='fab fa-youtube fa-2x'></i></a>"+
        "\t\t\t</div> "+
        "\t\t\t<p class='autor'>David Aravena</p>"+
        
        "\t\t</footer>\n"

            
            
        



elementos = head + header + navegacion + main + footer
File.write('./index_pag_cards.html', elementos)