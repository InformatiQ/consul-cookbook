We've tested 4 scenarios on consul 0.5.2

Scenario 1
----------

we stop the leader (clean shutdown), a new one is elected.
we stop the new leader, only one server left, no leader elected.

we start again the two other servers, no leader election happens.


Scenario 2
----------

we stop two non-leader servers (clean shutdown), leader keep his role
we start again the servers, leader keep his role


Scenario 3
----------

we stop two non-leader servers (hard shutdown), leader looses its role
we start again one server, leader election happens


Scenario 4
----------

we stop the leader (hard shutdown), a new one is elected
we stop the new leader (hard shutdown), no leader elected

we start again a server, a new leader is elected


Conclusion
----------

With clean shutdown, we rely on luck to be able to restart the cluster (unorchestrated way). Killing (hard shutdown) consul agent instead allows us to be able to go back to clean state even after an unorchestrated way.
