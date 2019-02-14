# job Demo
class FirstJobJob < ApplicationJob
  queue_as :default
  around_perform :around_cleanup

  def perform(args)
    @args = args
    sleep(args)
  end

  private

  def around_cleanup
    # Do something before perform
    yield
    ExpensesController.job_done(@args)
  end
end
