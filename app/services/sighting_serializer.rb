class SightingSerializer

    def initialize(sighting_object) # set an initialize method with a parameter that takes an object 
        @sighting = sighting_object #instance variable set to the parameter
    end

    def to_serialized_json
        options = {
            include: {
                bird: {
                    only: [:name, :species]
                },
                location: {
                    only: [:latitude, :longitude]
                }
            },
            except: [:updated_at],
        }
        @sighting.to_json(options)
        
        # removed from @sighting.to_json and placed in an options hash
        # (:include => {
        #     :bird => { :only [:name, :species] },
        #     :location => { :only [:latitude, :longitude] }
        # }, :except => [:updated_at])
    end

end
