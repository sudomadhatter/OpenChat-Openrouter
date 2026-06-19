const fs = require('fs');

const allModels = JSON.parse(fs.readFileSync('openrouter_all_models.json', 'utf8')).data;

const models = {
  anthropic: [],
  openai: [],
  google: [],
  meta: [],
  chinese: [],
  open_source: [],
  other: []
};

allModels.forEach(m => {
  const modelObj = { id: m.id, name: m.name };
  if (m.id.startsWith('anthropic/')) {
    models.anthropic.push(modelObj);
  } else if (m.id.startsWith('openai/')) {
    models.openai.push(modelObj);
  } else if (m.id.startsWith('google/')) {
    models.google.push(modelObj);
  } else if (m.id.startsWith('meta-llama/')) {
    models.meta.push(modelObj);
  } else if (['moonshotai/', 'qwen/', 'deepseek/', 'z-ai/'].some(p => m.id.startsWith(p))) {
    models.chinese.push(modelObj);
  } else if (['mistralai/', 'allenai/', 'cohere/', 'databricks/', 'gryphe/', 'huggingface/', 'lizhou/', 'migtissera/', 'nousresearch/', 'perplexity/', 'phind/', 'togethercomputer/'].some(p => m.id.startsWith(p))) {
    models.open_source.push(modelObj);
  } else {
    models.other.push(modelObj);
  }
});

// Update standard json files
fs.writeFileSync('models/anthropic_models.json', JSON.stringify(models.anthropic, null, 2));
fs.writeFileSync('models/openai_models.json', JSON.stringify(models.openai, null, 2));
fs.writeFileSync('models/google_models.json', JSON.stringify(models.google, null, 2));
fs.writeFileSync('models/meta_models.json', JSON.stringify(models.meta, null, 2));
fs.writeFileSync('models/chinese_models.json', JSON.stringify(models.chinese, null, 2));
fs.writeFileSync('models/open_source_models.json', JSON.stringify(models.open_source, null, 2));
fs.writeFileSync('models/other_models.json', JSON.stringify(models.other, null, 2));

console.log('Models updated successfully!');
