# Encapsulation/Separation of precondition logic for Pundit policies
module NaturalResource::PolicyPreconditions
  private

  def precondition(record, precondition=nil, identifier: nil, message: nil)
    precondition_met = if block_given?
                       yield
                     else
                       record.public_send(precondition)
                     end

    identifier ||= record.class.to_s.underscore
    message ||= "is not #{precondition.to_s.gsub(/\?*$/, '')}"

    unless precondition_met
      @failure_status ||= :precondition_failed
      @errors[identifier] << message
    end

    precondition_met
  end
end
