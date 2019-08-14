module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :all_links, [LinkType], null: false
    field :specific_link, LinkType, null: false do
      description 'fetch link using id'
      argument :id, ID, required: true
    end

    def all_links
      Link.all
    end

    def specific_link(id:)
      Link.find(id)
    end
  end
end
