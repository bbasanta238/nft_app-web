class ApplicationController < ActionController::Base
    before_action :setGonData
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def setGonData
        gon.web3StorageAPIKey= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDBFNTUyYmZEQWQ3Y2I0MjdkZDZlNTZkQzExNzg3N2M3NzY3ZGI5RTIiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NjYxNjkyMDI1MTYsIm5hbWUiOiJORlRfUHJvamVjdCJ9.QPYxmfbzubF1SPASlxj7LlazkQdBQPNs8oFNZmBwggs"
        gon.collectiblesAddress = "0x99d10E2B7067781FD1715A5D66fb9F7B4BEeaE10"
        gon.exchangeAddress="0xdaBF7C115546510B2f6AD08ec617Ecffeec40c6A"
    end

 
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:wallet_address])
    end
end
