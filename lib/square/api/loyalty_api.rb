module Square
  # LoyaltyApi
  class LoyaltyApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a loyalty account. To create a loyalty account, you must provide
    # the `program_id` and a `mapping` with the `phone_number` of the buyer.
    # @param [CreateLoyaltyAccountRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateLoyaltyAccountResponse Hash] response from the API call
    def create_loyalty_account(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Searches for loyalty accounts in a loyalty program.
    # You can search for a loyalty account using the phone number or customer ID
    # associated with the account. To return all loyalty accounts, specify an
    # empty `query` object or omit it entirely.
    # Search results are sorted by `created_at` in ascending order.
    # @param [SearchLoyaltyAccountsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchLoyaltyAccountsResponse Hash] response from the API call
    def search_loyalty_accounts(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a loyalty account.
    # @param [String] account_id Required parameter: The ID of the [loyalty
    # account]($m/LoyaltyAccount) to retrieve.
    # @return [RetrieveLoyaltyAccountResponse Hash] response from the API call
    def retrieve_loyalty_account(account_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts/{account_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'account_id' => { 'value' => account_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Adds points to a loyalty account.
    # - If you are using the Orders API to manage orders, you only provide the
    # `order_id`.
    # The endpoint reads the order to compute points to add to the buyer's
    # account.
    # - If you are not using the Orders API to manage orders,
    # you first perform a client-side computation to compute the points.
    # For spend-based and visit-based programs, you can first call
    # [CalculateLoyaltyPoints]($e/Loyalty/CalculateLoyaltyPoints) to compute the
    # points
    # that you provide to this endpoint.
    # @param [String] account_id Required parameter: The [loyalty
    # account]($m/LoyaltyAccount) ID to which to add the points.
    # @param [AccumulateLoyaltyPointsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [AccumulateLoyaltyPointsResponse Hash] response from the API call
    def accumulate_loyalty_points(account_id:,
                                  body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts/{account_id}/accumulate'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'account_id' => { 'value' => account_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Adds points to or subtracts points from a buyer's account.
    # Use this endpoint only when you need to manually adjust points. Otherwise,
    # in your application flow, you call
    # [AccumulateLoyaltyPoints]($e/Loyalty/AccumulateLoyaltyPoints)
    # to add points when a buyer pays for the purchase.
    # @param [String] account_id Required parameter: The ID of the [loyalty
    # account]($m/LoyaltyAccount) in which to adjust the points.
    # @param [AdjustLoyaltyPointsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [AdjustLoyaltyPointsResponse Hash] response from the API call
    def adjust_loyalty_points(account_id:,
                              body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/accounts/{account_id}/adjust'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'account_id' => { 'value' => account_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Searches for loyalty events.
    # A Square loyalty program maintains a ledger of events that occur during
    # the lifetime of a
    # buyer's loyalty account. Each change in the point balance
    # (for example, points earned, points redeemed, and points expired) is
    # recorded in the ledger. Using this endpoint, you can search the ledger for
    # events.
    # Search results are sorted by `created_at` in descending order.
    # @param [SearchLoyaltyEventsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchLoyaltyEventsResponse Hash] response from the API call
    def search_loyalty_events(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/events/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Returns a list of loyalty programs in the seller's account.
    # Loyalty programs define how buyers can earn points and redeem points for
    # rewards. Square sellers can have only one loyalty program, which is
    # created and managed from the Seller Dashboard. For more information, see
    # [Loyalty Program
    # Overview](https://developer.squareup.com/docs/loyalty/overview).
    # Replaced with [RetrieveLoyaltyProgram]($e/Loyalty/RetrieveLoyaltyProgram)
    # when used with the keyword `main`.
    # @return [ListLoyaltyProgramsResponse Hash] response from the API call
    def list_loyalty_programs
      warn 'Endpoint list_loyalty_programs in LoyaltyApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves the loyalty program in a seller's account, specified by the
    # program ID or the keyword `main`.
    # Loyalty programs define how buyers can earn points and redeem points for
    # rewards. Square sellers can have only one loyalty program, which is
    # created and managed from the Seller Dashboard. For more information, see
    # [Loyalty Program
    # Overview](https://developer.squareup.com/docs/loyalty/overview).
    # @param [String] program_id Required parameter: The ID of the loyalty
    # program or the keyword `main`. Either value can be used to retrieve the
    # single loyalty program that belongs to the seller.
    # @return [RetrieveLoyaltyProgramResponse Hash] response from the API call
    def retrieve_loyalty_program(program_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs/{program_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'program_id' => { 'value' => program_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Calculates the points a purchase earns.
    # - If you are using the Orders API to manage orders, you provide the
    # `order_id` in the request. The
    # endpoint calculates the points by reading the order.
    # - If you are not using the Orders API to manage orders, you provide the
    # purchase amount in
    # the request for the endpoint to calculate the points.
    # An application might call this endpoint to show the points that a buyer
    # can earn with the
    # specific purchase.
    # For spend-based and visit-based programs, the `tax_mode` setting of the
    # accrual rule indicates how taxes should be treated for loyalty points
    # accrual.
    # @param [String] program_id Required parameter: The [loyalty
    # program]($m/LoyaltyProgram) ID, which defines the rules for accruing
    # points.
    # @param [CalculateLoyaltyPointsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CalculateLoyaltyPointsResponse Hash] response from the API call
    def calculate_loyalty_points(program_id:,
                                 body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/programs/{program_id}/calculate'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'program_id' => { 'value' => program_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Creates a loyalty reward. In the process, the endpoint does following:
    # - Uses the `reward_tier_id` in the request to determine the number of
    # points
    # to lock for this reward.
    # - If the request includes `order_id`, it adds the reward and related
    # discount to the order.
    # After a reward is created, the points are locked and
    # not available for the buyer to redeem another reward.
    # @param [CreateLoyaltyRewardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateLoyaltyRewardResponse Hash] response from the API call
    def create_loyalty_reward(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Searches for loyalty rewards. This endpoint accepts a request with no
    # query filters and returns results for all loyalty accounts.
    # If you include a `query` object, `loyalty_account_id` is required and
    # `status` is  optional.
    # If you know a reward ID, use the
    # [RetrieveLoyaltyReward]($e/Loyalty/RetrieveLoyaltyReward) endpoint.
    # Search results are sorted by `updated_at` in descending order.
    # @param [SearchLoyaltyRewardsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchLoyaltyRewardsResponse Hash] response from the API call
    def search_loyalty_rewards(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Deletes a loyalty reward by doing the following:
    # - Returns the loyalty points back to the loyalty account.
    # - If an order ID was specified when the reward was created
    # (see [CreateLoyaltyReward]($e/Loyalty/CreateLoyaltyReward)),
    # it updates the order by removing the reward and related
    # discounts.
    # You cannot delete a reward that has reached the terminal state (REDEEMED).
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward]($m/LoyaltyReward) to delete.
    # @return [DeleteLoyaltyRewardResponse Hash] response from the API call
    def delete_loyalty_reward(reward_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/{reward_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'reward_id' => { 'value' => reward_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a loyalty reward.
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward]($m/LoyaltyReward) to retrieve.
    # @return [RetrieveLoyaltyRewardResponse Hash] response from the API call
    def retrieve_loyalty_reward(reward_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/{reward_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'reward_id' => { 'value' => reward_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Redeems a loyalty reward.
    # The endpoint sets the reward to the `REDEEMED` terminal state.
    # If you are using your own order processing system (not using the
    # Orders API), you call this endpoint after the buyer paid for the
    # purchase.
    # After the reward reaches the terminal state, it cannot be deleted.
    # In other words, points used for the reward cannot be returned
    # to the account.
    # @param [String] reward_id Required parameter: The ID of the [loyalty
    # reward]($m/LoyaltyReward) to redeem.
    # @param [RedeemLoyaltyRewardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [RedeemLoyaltyRewardResponse Hash] response from the API call
    def redeem_loyalty_reward(reward_id:,
                              body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/loyalty/rewards/{reward_id}/redeem'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'reward_id' => { 'value' => reward_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
