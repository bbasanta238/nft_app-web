class ApplicationController < ActionController::Base
    before_action :setGonData
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def setGonData
        gon.web3StorageAPIKey= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDBFNTUyYmZEQWQ3Y2I0MjdkZDZlNTZkQzExNzg3N2M3NzY3ZGI5RTIiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NjYxNjkyMDI1MTYsIm5hbWUiOiJORlRfUHJvamVjdCJ9.QPYxmfbzubF1SPASlxj7LlazkQdBQPNs8oFNZmBwggs"
        gon.collectiblesAddress = "0x881a00f1325389B28cFA3773fdE0428110f65c9B"
        gon.exchangeAddress="0x5ecCa6F7bbF2C49e5a3596A2CA22cEe59e825603"
    end

 
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:wallet_address])
    end
end
