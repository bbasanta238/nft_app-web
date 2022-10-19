class ApplicationController < ActionController::Base
    before_action :setGonData
    
    def setGonData
        gon.web3StorageAPIKey= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDBFNTUyYmZEQWQ3Y2I0MjdkZDZlNTZkQzExNzg3N2M3NzY3ZGI5RTIiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NjYxNjkyMDI1MTYsIm5hbWUiOiJORlRfUHJvamVjdCJ9.QPYxmfbzubF1SPASlxj7LlazkQdBQPNs8oFNZmBwggs"
    end
end
