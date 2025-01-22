unless Rails.env.test?

  require 'prometheus_exporter/server'

  # Check if the Prometheus Exporter server is already running
  def start_prometheus_server
    # You can check if the server is already running by attempting to bind to the port
    # If binding fails, it means the server is already running
    begin
      server = PrometheusExporter::Server::WebServer.new(bind: '0.0.0.0', port: 9394)
      server.start
      puts "Prometheus Exporter server started on port 9394"
    rescue Errno::EADDRINUSE
      puts "Prometheus Exporter server is already running on port 9394"
    end
  end

  # Call the method to start the server
  start_prometheus_server

end