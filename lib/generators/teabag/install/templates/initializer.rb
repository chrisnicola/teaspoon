Teabag.setup do |config|

  # Mounting / Route
  # This determines where the teabag spec path will be mounted. Changing this to /jasmine would allow you to browse to
  # http://localhost:3000/jasmine to run your jasmine specs.
  #
  # default: "/teabag"
  config.mount_at = "/teabag"

  # Root
  # The root path defaults to Rails.root if left nil, but if you're testing an engine using a dummy application it's
  # useful to be able to set this to your engines root.. E.g. Teabag::Engine.root
  #
  # default: nil, which forces defaulting to Rails.root
  config.root = nil

  # Fixtures
  # Fixtures are different than the specs, in that Rails is rendering them directly through a controller. This means you
  # can use haml, erb builder, rabl, etc. to render content in those views.
  #
  # default: "spec/javascripts/fixtures"
  config.fixture_path = "spec/javascripts/fixtures"

  # Asset paths
  # These paths are appended to the rails assets paths (relative to config.root), and by default is an array that we can
  # replace or add to.
  #
  # default: ["spec/javascripts", "spec/javascripts/stylesheets"]
  config.asset_paths << "app/assets/some_other_path"

  # Server timeout
  # Timeout for starting the server in seconds. If your server is slow to start you may have to bump the timeout, or you
  # may want to lower this if you know it shouldn't take long to start.
  #
  # default: 20
  config.server_timeout = 20

  # Suites
  # You can modify the default suite configuration or create new suites here. Suites can be entirely isolated from one
  # another. When defining a suite you can provide a name and a block. If the name is left blank, :default is assumed.
  # When defining suites, you can omit various directives and the defaults will be used.
  #
  # To run a specific suite
  #   - in the browser: http://localhost/teabag/[suite_name]
  #   - from the command line: rake teabag suite=[suite_name]
  config.suite do |suite|

    # File Matcher
    # You can specify a file matcher for your specs, and the matching files will be automatically loaded when the suite
    # is run. It's important that these files are serve-able from sprockets (aka the asset pipeline), otherwise it will
    # reference the full path of the file, which probably work out that well. Can be set to nil if you want to load all
    # your spec files from within the spec helper file (below).
    #
    # default: "{app/assets,spec/javascripts}/**/*_spec.{js,js.coffee,coffee}"
    suite.matcher = "{app/assets,spec/javascripts}/**/*_spec.{js,js.coffee,coffee}"

    # Spec Helper
    # Each suite can load a different spec helper, which can in turn require additional files. Since this file is served
    # via the asset pipeline, you can use the require directive and include whatever else seems useful to you. This file
    # is loaded before your specs are loaded -- so could potentially also include all of your specs (if you wanted to
    # set the matcher to nil).
    #
    # default: "spec_helper.js"
    suite.helper = "spec_helper.js"

    # Javascripts
    # These are the core teabag javascripts. Spec files should not go here -- but if you want to add additional support
    # for jasmine matchers, switch to mocha, include expectation libraries etc., this is the right place to do it..
    # Otherwise leave it be.
    #
    # To use mocha, you should switch this to "teabag/mocha".
    #
    # default: ["teabag/jasmine"]
    suite.javascripts = ["teabag/jasmine"]

    # Stylesheets
    # If you want to change how teabag looks, or include your own stylesheets you can do that here. By default it will
    # include some useful and basic stylesheets.
    #
    # default: ["teabag"]
    suite.stylesheets = ["teabag"]
  end

  # Here's an example of creating a named suite.  Since we're actually just filtering specs to files already within the
  # root spec/javascripts, these files will also be run in the default suite -- but can be focused into a more specific
  # suite.
  #
  # To run this suite
  #   - in the browser: http://localhost/teabag/targeted
  #   - from the command line: rake teabag suite=targeted
  #config.suite :targeted do |suite|
  #  suite.matcher = "spec/javascripts/targeted/*_spec.{js,js.coffee,coffee}"
  #end

end if defined?(Teabag) && Teabag.respond_to?(:setup) # let Teabag be undefined outside of development/test/asset groups