locals {
  # terraform remote backend prefix key means local and remote
  # wokspace names can differ.
  # assuming workspace are named as `prefix+env`, this section
  # extracts the env from both local or remote workspace names.
  _workspace_name_segments       = split("-", terraform.workspace)
  _workspace_name_segments_count = length(local._workspace_name_segments)
  workspace_env                  = local._workspace_name_segments[local._workspace_name_segments_count - 1]
}
