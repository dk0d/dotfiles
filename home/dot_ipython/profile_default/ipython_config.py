from IPython.terminal.prompts import Prompts, Token


class Prompter(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [
            (Token.Prompt, self.vi_mode()),
            (Token.Prompt, "["),
            (Token.PromptNum, str(self.shell.execution_count)),
            (Token.Prompt, "] ) "),
        ]

    def out_prompt_tokens(self):
        return [
            (Token.OutPrompt, "["),
            (Token.OutPromptNum, str(self.shell.execution_count)),
            (Token.OutPrompt, "]: "),
        ]


c = get_config()


def safe_set(obj, key, value):
    if hasattr(obj, key):
        setattr(obj, key, value)

safe_set(c.TerminalInteractiveShell, "autoindent", True)
safe_set(c.TerminalInteractiveShell, "editor", "vi")
safe_set(c.TerminalInteractiveShell, "prompts_class", Prompter)

try:
    c.InteractiveShellApp.extensions.extend(["autoreload"])
except AttributeError:
    pass
