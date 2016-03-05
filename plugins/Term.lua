--[[
	binsh by NXij
	https://github.com/NXij/binsh/
	https://github.com/topkecleon/binsh/
	Shell output for telegram-bot.
]]--

do

function run(msg, matches)
  if is_admin(msg) then
		return io.popen(matches[1]):read('*all')
  end
end

return {
  description = 'Run a system command.',
  usage = {
    admin = {
      '!bin <command>\n'
      ..'\nWARNING:'
      ..'\nThis plugin interfaces with your operating system.'
      ..'\nEven without root privileges, a bad command can be harmful.\n'
      ..'\nOnly for admins. Turned off after use.',
    },
  },
  patterns = {
    '^$(.*)$'
  },
  run = run,
  moderated = true
}

end