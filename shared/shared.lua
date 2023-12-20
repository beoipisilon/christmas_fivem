Config = {}

Config.Trees = { 
    {302.73,-870.79,29.2,304, 25, "Arvore de Natal", 0.4},
    {196.7,-808.78,31.0,304, 25, "Arvore de Natal", 0.4},
    {150.9,-829.6,31.0,304, 25, "Arvore de Natal", 0.4},
    {95.75,-976.7,29.,304, 25, "Arvore de Natal", 0.4},
    {-53.72,-960.14,29.3,304, 25, "Arvore de Natal", 0.4},
    {-158.51,-880.62,29.2,304, 25, "Arvore de Natal", 0.4},
    {-144.4,-724.73,34.7,304, 25, "Arvore de Natal", 0.4},
    {-235.46,-651.19,33.3,304, 25, "Arvore de Natal", 0.4},
    {-286.24,-369.11,29.9,304, 25, "Arvore de Natal", 0.4},
    {-520.03,-354.15,35.,304, 25, "Arvore de Natal", 0.4},
    {-628.21,-317.96,34.6,304, 25, "Arvore de Natal", 0.4},
    {-761.52,-97.22,37.4,304, 25, "Arvore de Natal", 0.4},
    {-737.93,88.91,55.6,304, 25, "Arvore de Natal", 0.4},
    {-558.59,237.46,82.,304, 25, "Arvore de Natal", 0.4},
    {-235.54,247.64,91.9,304, 25, "Arvore de Natal", 0.4},
    {26.09,271.55,109.5,304, 25, "Arvore de Natal", 0.4},
    {185.78,180.99,105.4,304, 25, "Arvore de Natal", 0.4},
    {355.15,159.1,102.9,304, 25, "Arvore de Natal", 0.4},
    {486.28,65.24,95.7,304, 25, "Arvore de Natal", 0.4},
    {426.52,-119.32,65.0,304, 25, "Arvore de Natal", 0.4},
}

Config.Gifts = {
    Debug = true,
	Object = 'nt_presetpequenoboy',
	FallSpeed = 1,
	UseFlareParticles = true,
	Blip = {
		Enabled = true,
		Sprite = 306,
		Colour = 28,
		Scale = 0.8,
		ShortRange = true,
	},
    Locations = {
        [1] = {
            vector3(301.93,-869.84,29.2),
            vector3(301.42,-871.79,29.22),
            vector3(299.82,-871.47,29.2)
        },
        [2] = {
            vector3(198.19,-810.55,31.07),
            vector3(199.15,-811.93,31.05),
            vector3(197.19,-811.54,31.1)
        },
        [3] = {
            vector3(151.48,-829.33,31.05),
            vector3(149.95,-828.96,31.07),
            vector3(150.72,-827.05,31.05)
        },
        [4] = {
            vector3(97.89,-976.14,29.32),
            vector3(96.02,-976.39,29.3),
            vector3(96.61,-977.85,29.28)
        },
        [5] = {
            vector3(-54.01,-961.79,29.37),
            vector3(-54.58,-959.96,29.37),
            vector3(-54.58,-959.96,29.37)
        },
        [6] = {
            vector3(-156.79,-881.53,29.27),
            vector3(-155.36,-880.48,29.28),
            vector3(-155.14,-882.38,29.3)
        },
        [7] = {
            vector3(-144.09,-724.4,34.73),
            vector3(-144.27,-721.93,34.71),
            vector3(-142.62,-722.53,34.69)
        },
        [8] = {
            vector3(-237.34,-651.63,33.3),
            vector3(-238.73,-652.81,33.21),
            vector3(-239.4,-650.78,33.21)
        },
        [9] = {
            vector3(-286.29,-369.41,29.98),
            vector3(-287.8,-367.31,29.98),
            vector3(-285.77,-367.45,29.98)
        },
        [10] = {
            vector3(-520.03,-354.15,35.3),
            vector3(-519.17,-354.8,35.3),
            vector3(-520.57,-353.43,35.3)
        },
        [11] = {
            vector3(-629.34,-317.92,34.69),
            vector3(-627.34,-317.11,34.69),
            vector3(-628.23,-318.89,34.68)
        },
        [12] = {
            vector3(-762.02,-98.13,37.47),
            vector3(-760.43,-96.84,37.51),
            vector3(-762.67,-96.79,37.51)
        },
        [13] = {
            vector3(-738.61,88.84,55.64),
            vector3(-738.54,90.97,55.61),
            vector3(-736.86,90.49,55.59)
        },
        [14] = {
            vector3(-557.27,236.76,82.83),
            vector3(-555.23,237.12,82.82),
            vector3(-556.66,238.78,82.92)
        },
        [15] = {
            vector3(-234.65,247.27,91.98),
            vector3(-232.98,247.35,91.97),
            vector3(-234.26,249.28,91.95)
        },
        [16] = {
            vector3(25.39,270.94,109.56),
            vector3(26.44,272.4,109.56),
            vector3(27.93,271.17,109.47)
        },
        [17] = {
            vector3(185.11,180.28,105.5),
            vector3(184.96,182.38,105.5),
            vector3(186.66,181.39,105.46)
        },
        [18] = {
            vector3(355.61,158.02,102.99),
            vector3(357.21,158.72,102.99),
            vector3(356.18,159.96,103.0)
        },
        [19] = {
            vector3(486.44,69.76,96.11),
            vector3(486.35,71.99,96.21),
            vector3(484.8,71.29,96.26)
        },
        [20] = {
            vector3(425.49,-119.93,64.94),
            vector3(424.45,-118.36,65.11),
            vector3(423.63,-120.0,64.96)
        },
    }    
}

Config.LootTables = {
    [1] = {
        Chance = 40, 
        Items = { 
            { name = 'WEAPON_SPECIALCARBINE_MK2', count = math.random(1,2)},
            { name = 'AMMO_SPECIALCARBINE_MK2', count = math.random(100,250)},
        }
    },
    [2] = {
        Chance = 60,
        Items = {
            { name = 'roupas', count = math.random(3,10)},
        }
    },
    [3] = {
        Chance = 20,
        Items = {
            { name = 'lsd', count = math.random(30,50)},
            { name = 'cocaina', count = math.random(50,100)},
        }
    },
    [4] = {
        Chance = 20,
        Items = {
            { name = 'WEAPON_PISTOL_MK2', count = math.random(1,3)},
        }
    },
    [5] = {
        Chance = 40,
        Items = {
            { name = 'AMMO_PISTOL_MK2', count = math.random(100,200)},
        }
    },
    [6] = {
        Chance = 40,
        Items = {
            { name = 'bandagem', count = math.random(1,5)},
        }
    },
    [7] = {
        Chance = 10,
        Items = {
            { name = 'energetico', count = math.random(60,100)},
        }
    },
    [8] = {
        Chance = 10,
        Items = {
            { name = 'energetico', count = math.random(30,60)},
        }
    },
}
