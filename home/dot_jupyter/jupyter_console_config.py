c = get_config()  # noqa

c.ZMQTerminalInteractiveShell.image_handler = 'PIL'
c.ZMQTerminalInteractiveShell.include_other_output = True
c.ZMQTerminalInteractiveShell.other_output_prefix = '[remote]\n'
