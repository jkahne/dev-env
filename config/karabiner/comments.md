{
  "description": "n => tap: n, hold: shift (lazy)",
  "manipulators": [
    {
      "type": "basic",
      "parameters": { "basic.to_if_held_down_threshold_milliseconds": 200 },
      "from": {
        "key_code": "n",
        "modifiers": {
          "optional": ["any"]
        }
      },
      "to_if_alone": [
        { "key_code": "n" }
      ],
      "to_if_held_down": [
        {
          "key_code": "left_shift",
          "lazy": true
        }
      ]
    }
  ]
},
{
  "description": "v => tap: v, hold: shift (lazy)",
  "manipulators": [
    {
      "type": "basic",
      "parameters": { "basic.to_if_held_down_threshold_milliseconds": 200 },
      "from": {
        "key_code": "v",
        "modifiers": {
          "optional": ["any"]
        }
      },
      "to_if_alone": [
        { "key_code": "v" }
      ],
      "to_if_held_down": [
        {
          "key_code": "left_shift",
          "lazy": true
        }
      ]
    }
  ]
},
{
  "description": "s => tap: s, hold: ctrl (lazy)",
  "manipulators": [
    {
      "type": "basic",
      "from": {
        "key_code": "s",
        "modifiers": {
          "optional": ["any"]
        }
      },
      "to_if_alone": [
        { "key_code": "s" }
      ],
      "to_if_held_down": [
        {
          "key_code": "left_control",
          "lazy": true
        }
      ]
    }
  ]
},
{
  "description": "d => tap: d, hold: cmd (lazy)",
  "manipulators": [
    {
      "type": "basic",
      "from": {
        "key_code": "d",
        "modifiers": {
          "optional": ["any"]
        }
      },
      "to_if_alone": [
        { "key_code": "d" }
      ],
      "to_if_held_down": [
        {
          "key_code": "left_command",
          "lazy": true
        }
      ]
    }
  ]
},
