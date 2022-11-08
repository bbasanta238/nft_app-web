class ApplicationController < ActionController::Base
    before_action :setGonData
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def setGonData
        gon.web3StorageAPIKey= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDBFNTUyYmZEQWQ3Y2I0MjdkZDZlNTZkQzExNzg3N2M3NzY3ZGI5RTIiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NjYxNjkyMDI1MTYsIm5hbWUiOiJORlRfUHJvamVjdCJ9.QPYxmfbzubF1SPASlxj7LlazkQdBQPNs8oFNZmBwggs"
        gon.contractAddress = "0x793b5cb782774AFEe8Aa563218b0330D3e9fffba"
    end

 
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:wallet_address])
    end
end
