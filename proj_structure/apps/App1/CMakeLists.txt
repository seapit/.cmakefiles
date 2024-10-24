# SET(${APP_NAME}_USE_C TRUE)
set(${APP_NAME}_USE_C FALSE)
# SET(${APP_NAME}_USE_GEN TRUE)
set(${APP_NAME}_USE_GEN FALSE)

# Get the name of the current directory
get_filename_component(APP_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

# Call the external function with the detected name
app(${APP_NAME} ${APP_NAME}_USE_C ${APP_NAME}_USE_GEN)
