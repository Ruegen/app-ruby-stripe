require 'webrick'
require 'erb'
require 'dotenv/load'

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

    def html_file(file) 
        path = File.join(__dir__, 'public', file)    
        html = ERB.new(File.open(path).read).result
        return html
    end

    def do_POST(request, response)
        case request.path
        when "/charge" 
            puts "charge"  
        else
            response.status = 400
            response.body = "Route not found"
        end
    end

end

server = WEBrick::HTTPServer.new(Port: 3000)
trap 'INT' do server.shutdown end
server.mount '/', Routes
server.start