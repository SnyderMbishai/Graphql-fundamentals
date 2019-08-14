module Mutations
    class CreateLink < BaseMutation
        #arguments
        argument :description, String, required:true
        argument :url, String, required: true

        #type
        type Types::LinkType

        def resolve(description: nil, url: nil)
            Link.create!(
                description: description,
                url: url
            )
        end
    end
end
