ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Deliverix.Repo, :manual)

Mox.defmock(Deliverix.ViaCep.ClientMock, for: Deliverix.ViaCep.Behaviour)
