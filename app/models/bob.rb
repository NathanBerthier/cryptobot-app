class Bob < ApplicationRecord
  def switch_status
    case self.status
    when 'working'
      File.write("#{Rails.root}/app/jobs/bob_status.txt", 'waiting')
      return 'waiting'
    when 'waiting'
      return 'sleeping'
    when 'sleeping'
      return 'working'
    end
  end

  def work
    MoulaJob.perform_later
  end
end
