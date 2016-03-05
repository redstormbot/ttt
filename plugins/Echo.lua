local function run(msg, matches)
 local text = matches[2]
 if matches[1]:lower() == "echo" then
  return text
  else
  local file = io.open("./files/"..matches[1], "w")
  file:write(text)
  file:flush()
  file:close()
  return send_document("chat#id"..msg.to.id,"./files/"..matches[1], ok_cb, false)
 end
end
return {
 description = "Simplest plugin ever!",
 usage = {
  "Echo [text] : return text",
  "Echo> [subject].[ext] [text] : save text to file",
 },
 patterns = {
  "^[!/]([Ee]cho) (.*)$",
  "^[!/][Ee]cho> ([^%s]+) (.*)$",
  "^([Ee]cho) (.*)$",
  "^[Ee]cho> ([^%s]+) (.*)$",
 },
 run = run
}