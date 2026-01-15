{lib}:
lib.mkOption {
  type = lib.types.submodule {
    options = {
      tools = lib.mkOption {
        type = lib.types.submodule {
          options = {
            ls = lib.mkOption {
              type = lib.types.submodule {
                options = {
                  max_items = lib.mkOption {
                    type = lib.types.int;
                    default = 1000;
                    description = "Maximum number of items to return for the ls tool";
                  };

                  max_depth = lib.mkOption {
                    type = lib.types.int;
                    default = 0;
                    description = "Maximum depth for the ls tool";
                  };

                };
              };
            };

          };
        };
      };

      models = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule {
          options = {
            presence_penalty = lib.mkOption {
              type = lib.types.number;
              description = "Presence penalty to increase topic diversity";
            };

            provider = lib.mkOption {
              type = lib.types.str;
              description = "The model provider ID that matches a key in the providers config";
            };

            reasoning_effort = lib.mkOption {
              type = lib.types.enum [
                "low"
                "medium"
                "high"
              ];
              description = "Reasoning effort level for OpenAI models that support it";
            };

            temperature = lib.mkOption {
              type = lib.types.number;
              description = "Sampling temperature";
            };

            think = lib.mkOption {
              type = lib.types.bool;
              description = "Enable thinking mode for Anthropic models that support reasoning";
            };

            top_k = lib.mkOption {
              type = lib.types.int;
              description = "Top-k sampling parameter";
            };

            frequency_penalty = lib.mkOption {
              type = lib.types.number;
              description = "Frequency penalty to reduce repetition";
            };

            max_tokens = lib.mkOption {
              type = lib.types.int;
              description = "Maximum number of tokens for model responses";
            };

            provider_options = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              description = "Additional provider-specific options for the model";
            };

            top_p = lib.mkOption {
              type = lib.types.number;
              description = "Top-p (nucleus) sampling parameter";
            };

            model = lib.mkOption {
              type = lib.types.str;
              description = "The model ID as used by the provider API";
            };

          };
        });
        description = "Model configurations for different model types";
      };

      permissions = lib.mkOption {
        type = lib.types.submodule {
          options = {
            allowed_tools = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "List of tools that don't require permission prompts";
            };

          };
        };
      };

      providers = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule {
          options = {
            api_key = lib.mkOption {
              type = lib.types.str;
              description = "API key for authentication with the provider";
            };

            base_url = lib.mkOption {
              type = lib.types.str;
              description = "Base URL for the provider's API";
            };

            extra_body = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              description = "Additional fields to include in request bodies";
            };

            extra_headers = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              description = "Additional HTTP headers to send with requests";
            };

            name = lib.mkOption {
              type = lib.types.str;
              description = "Human-readable name for the provider";
            };

            disable = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Whether this provider is disabled";
            };

            id = lib.mkOption {
              type = lib.types.str;
              description = "Unique identifier for the provider";
            };

            models = lib.mkOption {
              type = lib.types.listOf (lib.types.submodule {
                options = {
                  reasoning_levels = lib.mkOption {
                    type = lib.types.listOf lib.types.str;
                  };

                  supports_attachments = lib.mkOption {
                    type = lib.types.bool;
                  };

                  context_window = lib.mkOption {
                    type = lib.types.int;
                  };

                  cost_per_1m_in = lib.mkOption {
                    type = lib.types.number;
                  };

                  cost_per_1m_out = lib.mkOption {
                    type = lib.types.number;
                  };

                  cost_per_1m_out_cached = lib.mkOption {
                    type = lib.types.number;
                  };

                  id = lib.mkOption {
                    type = lib.types.str;
                  };

                  can_reason = lib.mkOption {
                    type = lib.types.bool;
                  };

                  cost_per_1m_in_cached = lib.mkOption {
                    type = lib.types.number;
                  };

                  default_max_tokens = lib.mkOption {
                    type = lib.types.int;
                  };

                  default_reasoning_effort = lib.mkOption {
                    type = lib.types.str;
                  };

                  name = lib.mkOption {
                    type = lib.types.str;
                  };

                  options = lib.mkOption {
                    type = lib.types.submodule {
                      options = {
                        top_p = lib.mkOption {
                          type = lib.types.number;
                        };

                        frequency_penalty = lib.mkOption {
                          type = lib.types.number;
                        };

                        presence_penalty = lib.mkOption {
                          type = lib.types.number;
                        };

                        provider_options = lib.mkOption {
                          type = lib.types.attrsOf lib.types.anything;
                        };

                        temperature = lib.mkOption {
                          type = lib.types.number;
                        };

                        top_k = lib.mkOption {
                          type = lib.types.int;
                        };

                      };
                    };
                  };

                };
              });
              description = "List of models available from this provider";
            };

            oauth = lib.mkOption {
              type = lib.types.submodule {
                options = {
                  expires_at = lib.mkOption {
                    type = lib.types.int;
                  };

                  expires_in = lib.mkOption {
                    type = lib.types.int;
                  };

                  refresh_token = lib.mkOption {
                    type = lib.types.str;
                  };

                  access_token = lib.mkOption {
                    type = lib.types.str;
                  };

                };
              };
            };

            provider_options = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              description = "Additional provider-specific options for this provider";
            };

            system_prompt_prefix = lib.mkOption {
              type = lib.types.str;
              description = "Custom prefix to add to system prompts for this provider";
            };

            type = lib.mkOption {
              type = lib.types.enum [
                "openai"
                "openai-compat"
                "anthropic"
                "gemini"
                "azure"
                "vertexai"
              ];
              default = "openai";
              description = "Provider type that determines the API format";
            };

          };
        });
        description = "AI provider configurations";
      };

      recent_models = lib.mkOption {
        type = lib.types.attrsOf lib.types.anything;
        description = "Recently used models sorted by most recent first";
      };

      lsp = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule {
          options = {
            filetypes = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "File types this LSP server handles";
            };

            init_options = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              description = "Initialization options passed to the LSP server during initialize request";
            };

            options = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              description = "LSP server-specific settings passed during initialization";
            };

            root_markers = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "Files or directories that indicate the project root";
            };

            args = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "Arguments to pass to the LSP server command";
            };

            command = lib.mkOption {
              type = lib.types.str;
              description = "Command to execute for the LSP server";
            };

            disabled = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Whether this LSP server is disabled";
            };

            env = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              description = "Environment variables to set to the LSP server command";
            };

          };
        });
      };

      mcp = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule {
          options = {
            args = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "Arguments to pass to the MCP server command";
            };

            env = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              description = "Environment variables to set for the MCP server";
            };

            headers = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              description = "HTTP headers for HTTP/SSE MCP servers";
            };

            timeout = lib.mkOption {
              type = lib.types.int;
              default = 15;
              description = "Timeout in seconds for MCP server connections";
            };

            type = lib.mkOption {
              type = lib.types.enum [
                "stdio"
                "sse"
                "http"
              ];
              default = "stdio";
              description = "Type of MCP connection";
            };

            command = lib.mkOption {
              type = lib.types.str;
              description = "Command to execute for stdio MCP servers";
            };

            disabled = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Whether this MCP server is disabled";
            };

            disabled_tools = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "List of tools from this MCP server to disable";
            };

            url = lib.mkOption {
              type = lib.types.str;
              description = "URL for HTTP or SSE MCP servers";
            };

          };
        });
      };

      options = lib.mkOption {
        type = lib.types.submodule {
          options = {
            tui = lib.mkOption {
              type = lib.types.submodule {
                options = {
                  compact_mode = lib.mkOption {
                    type = lib.types.bool;
                    default = false;
                    description = "Enable compact mode for the TUI interface";
                  };

                  completions = lib.mkOption {
                    type = lib.types.submodule {
                      options = {
                        max_depth = lib.mkOption {
                          type = lib.types.int;
                          default = 0;
                          description = "Maximum depth for the ls tool";
                        };

                        max_items = lib.mkOption {
                          type = lib.types.int;
                          default = 1000;
                          description = "Maximum number of items to return for the ls tool";
                        };

                      };
                    };
                  };

                  diff_mode = lib.mkOption {
                    type = lib.types.enum [
                      "unified"
                      "split"
                    ];
                    description = "Diff mode for the TUI interface";
                  };

                };
              };
            };

            context_paths = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "Paths to files containing context information for the AI";
            };

            debug = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Enable debug logging";
            };

            debug_lsp = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Enable debug logging for LSP servers";
            };

            disable_default_providers = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Ignore all default/embedded providers. When enabled";
            };

            disabled_tools = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "List of built-in tools to disable and hide from the agent";
            };

            initialize_as = lib.mkOption {
              type = lib.types.str;
              default = "AGENTS.md";
              description = "Name of the context file to create/update during project initialization";
            };

            attribution = lib.mkOption {
              type = lib.types.submodule {
                options = {
                  co_authored_by = lib.mkOption {
                    type = lib.types.bool;
                    description = "Deprecated: use trailer_style instead";
                  };

                  generated_with = lib.mkOption {
                    type = lib.types.bool;
                    default = true;
                    description = "Add Generated with Crush line to commit messages and issues and PRs";
                  };

                  trailer_style = lib.mkOption {
                    type = lib.types.enum [
                      "none"
                      "co-authored-by"
                      "assisted-by"
                    ];
                    default = "assisted-by";
                    description = "Style of attribution trailer to add to commits";
                  };

                };
              };
            };

            data_directory = lib.mkOption {
              type = lib.types.str;
              default = ".crush";
              description = "Directory for storing application data (relative to working directory)";
            };

            disable_auto_summarize = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Disable automatic conversation summarization";
            };

            disable_metrics = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Disable sending metrics";
            };

            disable_provider_auto_update = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Disable providers auto-update";
            };

            skills_paths = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "Paths to directories containing Agent Skills (folders with SKILL.md files)";
            };

          };
        };
      };

    };
  };
  default = {};
}
