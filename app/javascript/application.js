// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";

// importing js packages
import "./src/jquery";

// importing custom js
import "./custom/metamaskConnection";
import "./custom/mintForm";
import "./custom/ipfsUploader";
import "./custom/approval";
