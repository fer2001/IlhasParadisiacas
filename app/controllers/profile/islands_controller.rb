module Profile
  class IslandsController < ApplicationController
    def index
      @islands = policy_scope(Island, policy_scope_class: IslandPolicy::MyIslandsScope)
      authorize @islands
    end
  end
end
