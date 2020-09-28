const { environment } = require("@rails/webpacker"); //already present
const webpack = require("webpack");
environment.plugins.append(
	"Provide",
	new webpack.ProvidePlugin({
		$: "jquery",
		jQuery: "jquery",
		Popper: ["popper.js", "default"],
	})
); //already present
