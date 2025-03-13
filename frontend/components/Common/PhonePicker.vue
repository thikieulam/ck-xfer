<template>
  <div class="phone-picker">
    <div class="flex items-center space-x-2">
      <select
        v-model="selectedCountry"
        class="block w-24 p-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
      >
        <option
          v-for="country in countries"
          :key="country.code"
          :value="country.dial_code"
        >
          {{ country.flag }} {{ country.dial_code }}
        </option>
      </select>
      <input
        type="tel"
        v-model="phoneNumber"
        class="block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
        placeholder="Phone number"
        @input="emitPhoneNumber"
      />
    </div>
  </div>
</template>

<script setup>
import { ref, watch, defineProps, defineEmits } from "vue";

const props = defineProps({
  modelValue: String,
});

const emit = defineEmits(["update:modelValue"]);

const countries = [
  { name: "Vietnam", code: "VN", dial_code: "+84", flag: "🇻🇳" },
];

const selectedCountry = ref(countries[0].dial_code);
const phoneNumber = ref("");

watch(
  () => props.modelValue,
  (newValue) => {
    const countryCode = newValue.substring(0, newValue.indexOf(" "));
    const phone = newValue.substring(newValue.indexOf(" ") + 1);
    selectedCountry.value = countryCode || countries[0].dial_code;
    phoneNumber.value = phone || "";
  }
);

function emitPhoneNumber() {
  const fullNumber = `${selectedCountry.value} ${phoneNumber.value}`;
  emit("update:modelValue", fullNumber);
}
</script>

<style scoped>
/* Add any scoped styles if necessary */
</style>
