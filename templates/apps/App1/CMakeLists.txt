#SET(${APP_NAME}_USE_C_FILES TRUE)
SET(${APP_NAME}_USE_C_FILES FALSE)
#SET(${APP_NAME}_USE_GENERATED_FILES TRUE)
SET(${APP_NAME}_USE_GENERATED_FILES FALSE)

# Get the name of the current directory
get_filename_component(APP_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

# Call the external function with the detected name
APP(${APP_NAME} ${APP_NAME}_USE_C_FILES ${APP_NAME}_USE_GENERATED_FILES)
