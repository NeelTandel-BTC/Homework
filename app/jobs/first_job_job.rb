# job Demo
class FirstJobJob < ApplicationJob
  queue_as :default

  def perform(args)
    sleep(args)
  end

  private

  def around_cleanup
    # Do something before perform
    yield
    ExpensesController.job_done
  end
end
