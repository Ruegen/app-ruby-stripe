require 'webrick'
require 'erb'
require 'dotenv/load'
require 'stripe'

class Routes < WEBrick::HTTPServlet::AbstractServlet

    def do_GET(request, response) 
        case request.path
        when "/"
            response.status = 200
            response['Content-Type'] = 'text/html'
            response.body = html_file("index.html")
        else
            response.status = 400
            response.body = "Route not found"
        end
    end

    def do_POST(request, response)
        case request.path
        when "/charge" 
            token = request.body.split('=')[1]
            ###
            # configure stripe
            Stripe.api_key = ENV["STRIPE_TEST_KEY"]

            # # 1. Charges
            stripe_response = Stripe::Charge.create({
                :amount => 2000, #dollars in cents
                :currency => "aud", # Australia currency
                :source => "tok_amex", # obtained with Stripe.js
                :description => "Charge for ruegen.aschenbrenner@coderacademy.edu.au"
            })


            html = """
            <html>
            <body>
            <p>Description: #{stripe_response.description}</p>
            <p>Amount: #{stripe_response.amount}</p>
            <p>Currency: #{stripe_response.currency}</p>
            </body>
            </html>
            """
            response.status = 200
            response['Content-Type'] = 'text/html'
            response.body = html 

            ###
        else
            response.status = 400
            response.body = "Route not found"
        end
    end

    private 
    def html_file(file) 
        path = File.join(__dir__, 'public', file)    
        html = ERB.new(File.open(path).read).result
        return html
    end

end

server = WEBrick::HTTPServer.new(Port: 3000)
trap 'INT' do server.shutdown end
server.mount '/', Routes
server.start