using BoundaryValueDiffEq
function fun!(x, u, du)
    du[1] = u[2]
    du[2] = -200*sin(u[1])
end

function boundary!(residual, u)
    residual[1] = u[1][1]
    residual[2] = u[end][1]+u[end÷2][1]+3+u[end÷2][2]
end

tspan = (0.,1.)
u0 = [0.,-2.]
dt = .02
bvp = BVProblem(fun!, boundary!, u0, tspan)
sol = solve(bvp, MIRK(4), dt=dt)
