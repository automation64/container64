# Snippet: 1.0.0
# X_CODE_PLACEHOLDER_4_X
export CNT64_USER

# X_CODE_PLACEHOLDER_3_X

function cnt64_setup_create_users() {
  bl64_dbg_app_show_function
  bl64_msg_show_task "Create entrypoint user (${CNT64_USER})"
  bl64_iam_user_add "${CNT64_USER}"
}

# X_CODE_PLACEHOLDER_2_X
  bl64_check_export 'CNT64_USER' &&

# X_CODE_PLACEHOLDER_1_X
  cnt64_setup_create_users
