class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/" {
            controller = "program"
            action = "list"
        }

        "/oldindex"(view: "/index")
		"500"(view:'/error')
	}
}
