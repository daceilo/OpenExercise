class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/" {
            controller = "program"
            action = "edit"
            id = "1"
        }

        "/oldindex"(view: "/index")
		"500"(view:'/error')
	}
}
