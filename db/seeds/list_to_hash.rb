class ICD10Gen

  attr_accessor :parents, :children, :children_2, :children_3

  def initialize
    @parents = []
    @children = []
    @children_2 = []
    @children_3 = []
    @data = JSON.parse(File.read("#{Rails.root}/db/seeds/list.json"))
    @chapters =  @data["ICD10CM.tabular"]['chapter']
    generate
  end

  def generate
    @chapters.each do |chapter|
      chapter['section'].each do |k|
        if k.has_key? 'diag'
          k['diag'].each do |x|
            @parents << {code_id: x['name'], desc: x['desc'], chapter: chapter['name'],
                section_name: k['desc'],
                inclusionTerm: x['inclusionTerm'].try(:[], 'note') || '', 
                includes: x['includes'].try(:[], 'note') || '',
                excludes1: x['excludes1'].try(:[], 'note') || '', excludes2: x['excludes2'].try(:[], 'note') || '',
                parent_id: ''}
            if x.has_key? 'diag'
              x['diag'].each do |a|
                @children << {code_id: a['name'], desc: a['desc'], parent_id: x['name'],
                   inclusionTerm: a['inclusionTerm'].try(:[], 'note') || '',
                   includes: a['includes'].try(:[], 'note') || '',
                   excludes1: a['excludes1'].try(:[], 'note') || '',
                   excludes2: a['excludes2'].try(:[], 'note') || ''}
                if a.has_key? 'diag'
                  a['diag'].each do |b|
                    @children_2 << {code_id: b['name'], desc: b['desc'], parent_id: a['name'],
                       inclusionTerm: b['inclusionTerm'].try(:[], 'note') || '',
                       includes: b['includes'].try(:[], 'note') || '',
                       excludes1: b['excludes1'].try(:[], 'note') || '',
                       excludes2: b['excludes2'].try(:[], 'note') || ''}
                    if b.has_key? 'diag'
                      b['diag'].each do |c|
                        @children_3 << {code_id: c['name'], desc: c['desc'], parent_id: b['name'],
                           inclusionTerm: c['inclusionTerm'].try(:[], 'note') || '',
                           includes: c['includes'].try(:[], 'note') || '',
                           excludes1: c['excludes1'].try(:[], 'note') || '',
                           excludes2: c['excludes2'].try(:[], 'note') || ''}
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
