class ApplicationController < ActionController::Base
    before_action :setGonData
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def setGonData
        gon.web3StorageAPIKey= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDBFNTUyYmZEQWQ3Y2I0MjdkZDZlNTZkQzExNzg3N2M3NzY3ZGI5RTIiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NjYxNjkyMDI1MTYsIm5hbWUiOiJORlRfUHJvamVjdCJ9.QPYxmfbzubF1SPASlxj7LlazkQdBQPNs8oFNZmBwggs"
        gon.collectiblesAddress = "0x4438b51460Ba3D7e364c525a80Fa6A4813b22948"
        gon.exchangeAddress="0xB79321c4A98cD4198fB3Aa90ba167f5F25597257"
    end

 
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:wallet_address])
    end
end
