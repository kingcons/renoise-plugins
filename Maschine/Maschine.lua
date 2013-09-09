--[[----------------------------------------------------------------------------
-- Duplex.Maschine
----------------------------------------------------------------------------]]--

-- v0.2


--==============================================================================

class "Maschine" (MidiDevice)

function Maschine:__init(display_name, message_stream, port_in, port_out)
  TRACE("Maschine:__init", display_name, message_stream, port_in, port_out)

  MidiDevice.__init(self, display_name, message_stream, port_in, port_out)


end


--------------------------------------------------------------------------------

-- setup a Mixer and Effect application

duplex_configurations:insert {

  -- configuration properties
  name = "Mixer + Transport + Matrix + Effects",
  pinned = true,

  -- device properties
  device = {
    class_name = "Maschine",          
    display_name = "Maschine",
    device_port_in = "Maschine",
    device_port_out = "Maschine",
    control_map = "Controllers/Maschine/Maschine.xml",
    thumbnail = "Maschine.bmp",
    protocol = DEVICE_MIDI_PROTOCOL
  },
  
  applications = {
    Mixer = {
      mappings = {
        levels = {
          group_name = "Encoders",
        },
        mute = {
          group_name = "Buttons1",
        },
        master = {
          group_name = "Master",
          index = 1
        },
        page = {
          group_name = "Navigation2",
        },
        
      },
      options = {
        pre_post = 2
      }
    },
    Matrix = {
      mappings = {
        matrix = {
          group_name = "Pads",
        },
        triggers = {
          group_name = "Triggers",
        },
        sequence = {
          group_name = "Groups1",
        },
        track = {
          group_name = "Groups2",
        }
      }
    },
    Effect = {
      mappings = {
        parameters = {
          group_name = "Encoders2",
        },
        page = {
          group_name = "Page",
        },
        device = {
          group_name = "Device",
        }
      }
    },
    Transport = {
      mappings = {
        stop_playback = {
          group_name = "Transport",
          index = 1
        },
        goto_previous = {
          group_name = "Transport",
          index = 2
        },
        goto_next = {
          group_name = "Transport",
          index = 3
        },
        loop_pattern = {
          group_name = "Transport",
          index = 4
        },
        start_playback = {
          group_name = "Transport",
          index = 5
        },
        edit_mode = {
          group_name = "Transport",
          index = 6
        },
        block_loop = {
          group_name = "Master",
          index = 4
        },
      },
    }
  }
}
