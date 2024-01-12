# frozen_string_literal: true

class Thinkific::Client
  module SiteScripts

    # Gets a list of Site Scripts owned by the authenticated user.
    #
    # @example
    #   Thinkific.site_scripts
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Site%20Scripts})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def site_scripts(options = {})
      get('/site_scripts', query: options)
    end

    # Get a single Site Scripts.
    #
    # @example
    #   Thinkific.site_script(1)
    #
    # @param  [Integer] id The ID of a Site Scripts.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Site Scripts
    def site_script(id)
      get("/site_scripts/#{id}")
    end

    # Creates a new Site Scripts.
    #
    # @example
    #   Thinkific.create_site_scripts(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Site Scripts.
    def create_site_scripts(body_params)
      post("/site_scripts", body: body_params)
    end

    # Updates a Site Scripts.
    #
    # @example
    #   Thinkific.edit_site_scripts(1, edit_params)
    #
    # @param  [Integer] id The ID of a Site Scripts.
    # @param  [Hash] edit_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about updated Site Scripts.
    def edit_site_scripts(id, edit_params = {})
      put("/site_scripts/#{id}", body: edit_params)
    end

    # Deletes a Site Scripts.
    #
    # @example
    #   Thinkific.delete_site_scripts(1)
    #
    # @param  [Integer] id The ID of a Site Scripts.
    # @return [void] This API call returns an empty response Site Scripts.
    def delete_site_scripts(id)
      delete("/site_scripts/#{id}")
    end
  end
end
