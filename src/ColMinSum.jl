module ColMinSum

export colminsum, rowminsum, xcolminsum, xrowminsum

struct Credibility{T <: Real}
	v::T
end

incrediblize(x::Credibility) = x.v

Base.:+(x::Credibility, y::Credibility) = Credibility(x.v + y.v)
Base.:*(x::Credibility, y::Credibility) = Credibility(min(x.v, y.v))
Base.adjoint(x::Credibility) = x
Base.zero(x::Credibility{T}) where T = Credibility(zero(T))
Base.conj!(m::AbstractMatrix{Credibility{T}}) where {T <: Real} = m
Base.copy(x::Credibility) = Credibility(x.v)

function colminsum(a::AbstractMatrix{<:Real})
	m = Credibility.(a)
	incrediblize.(m' * m)
end

rowminsum(a::AbstractMatrix{<:Real}) = colminsum(a')

xcolminsum(a::AbstractMatrix{<:Real}, b::AbstractMatrix{<:Real}) =
	incrediblize.(Credibility.(a)' * Credibility.(b))

xrowminsum(a::AbstractMatrix{<:Real}, b::AbstractMatrix{<:Real}) =
	xcolminsum(a', b')
	
end # module
