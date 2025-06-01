{
    "description": "Map j & k to Hyper Minor when held",
    "manipulators": [
        {
        "from": { "simultaneous": [ { "key_code": "j" }, { "key_code": "k" } ],
            "modifiers": { "optional": ["any"] }, "simultaneous_options": { "detect_key_down_uninterruptedly": true, "key_down_order": "insensitive", "key_up_order": "insensitive" } }, "parameters": { "basic.simultaneous_threshold_milliseconds": 50 },
            "to": [ { "key_code": "left_command", "modifiers": ["left_control", "left_option"] } ], "type": "basic"
        }
    ]
},
