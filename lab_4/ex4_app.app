{application, ex4_app,
 [
  {description, "Example OTP application"},
  {vsn, "1.0"},
  {modules, [ex4_ring_sup, ex4_ring]},
  {registered, []},
  {applications, [kernel, stdlib]},
  {mod, {ex4_app, []}}
 ]}.
