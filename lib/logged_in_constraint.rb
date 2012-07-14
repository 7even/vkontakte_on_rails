class LoggedInConstraint
  def matches?(request)
    request.session.key?(:vk_id)
  end
end
