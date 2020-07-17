class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.data[:html_url].present?
  end

  private

  def gist_params
    {
      description: I18n.t('description', title: @test.title),
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.description]
    content += @question.answers.pluck(:option)
    content.join("\n")
  end
end
