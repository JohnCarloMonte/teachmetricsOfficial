-- Add status field to profiles table to track approval status (always approved)
ALTER TABLE public.profiles 
ADD COLUMN status TEXT DEFAULT 'approved' CHECK (status = 'approved');

-- Update all existing records to approved
UPDATE public.profiles 
SET status = 'approved';

-- Create index on status for better query performance
CREATE INDEX idx_profiles_status ON public.profiles(status);